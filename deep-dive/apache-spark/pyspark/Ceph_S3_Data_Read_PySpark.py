# Import Spark Library

from pyspark.sql import SparkSession

# Create a Spark Context

spark = SparkSession.builder \
        .appName('amazon-data-review') \
        .getOrCreate()

# Read Source Datasets

musical_data= spark.read.json("s3a://spark-demo/Musical_Instruments_data.json")
musical_metadata= spark.read.json("s3a://spark-demo/Musical_Instruments_metadata.json")

# Register dataframes as temp tables

musical_metadata.registerTempTable("musical_metadata")
musical_data.registerTempTable("musical_data")

# Top products based on unique user reviews

top_rated = spark.sql("""
select musical_data.asin as product_id,
        count(distinct musical_data.reviewerID) as unique_reviewer_id_count,
        musical_metadata.price as product_price
from musical_data left outer join musical_metadata
on musical_data.asin == musical_metadata.asin
group by product_id, product_price
order by unique_reviewer_id_count desc
limit 10
""")

# Display top 10 products

top_rated.show(truncate=False)

# Save output as csv

top_rated.write.format("csv") \
        .option("header","true") \
        .mode("overwrite") \
        .save("s3a://spark-demo/output/amazon_data_review/top_10_rated")

# Stop Spark Context to release resources

spark.stop()