# Airflow DEMO DAG
from airflow import DAG
from datetime import timedelta, datetime
from kubernetes.client import models as k8s
from airflow.contrib.operators.kubernetes_pod_operator import KubernetesPodOperator

args = {
    "owner": "prateek.dubey",
    "email": ["dataengineeringe2e@gmail.com"],
    "depends_on_past": False,
    "start_date": datetime(2019,1,1),
    "catchup": False,
    "email_on_failure": False,
    "email_on_retry": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5)
}

dag = DAG(dag_id='kubernetes_sample_dag', default_args=args, schedule_interval=None)

amazon_data_review = KubernetesPodOperator(
    namespace='spark',
    image='dataengineeringe2e/spark-ubuntu-3.0.1',
    image_pull_policy='Always',
    service_account_name='spark',
    name='amazon_data_review',
    task_id='amazon_data_review',
    in_cluster=True,
    get_logs=True,
    arguments=[
        '/opt/spark/bin/spark-submit',
        '--master', 'k8s://https://rancher.example.com:6443',
        '--deploy-mode', 'cluster',
        '--name', 'amazon-data-review',
        '--conf', 'spark.kubernetes.driver.pod.name=amazon-data-review',
        '--conf', 'spark.kubernetes.executor.podNamePrefix=amazon-data-review',
        '--conf', 'spark.kubernetes.namespace=spark',
        '--conf', 'spark.kubernetes.container.image=dataengineeringe2e/spark-ubuntu-3.0.1',
        '--conf', 'spark.kubernetes.container.image.pullPolicy=Always',
        '--conf', 'spark.kubernetes.authenticate.driver.serviceAccountName=spark',
        '--conf', 'spark.kubernetes.authenticate.executor.serviceAccountName=spark',
        '--conf', 'spark.kubernetes.authenticate.submission.caCertFile=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt',
        '--conf', 'spark.kubernetes.authenticate.submission.oauthTokenFile=/var/run/secrets/kubernetes.io/serviceaccount/token',
        '--conf', 'spark.hadoop.fs.s3a.access.key=6IGVZCXF964W89OP2EA3',
        '--conf', 'spark.hadoop.fs.s3a.secret.key=vcSOSqD7MBdeUToQqQj7A8ozBKtf2X6Fri8cWjbe',
        '--conf', 'spark.hadoop.fs.s3a.aws.credentials.provider=org.apache.hadoop.fs.s3a.SimpleAWSCredentialsProvider',
        '--conf', 'spark.hadoop.fs.s3a.endpoint=http://ceph.example.com:8080',
        '--conf', 'spark.hadoop.fs.s3a.connection.ssl.enabled=false',
        '--conf', 'spark.hadoop.fs.s3a.path.style.access=true',
        '--conf', 'spark.executor.instances=2',
        '--conf', 'spark.executor.cores=3',
        '--conf', 'spark.executor.memory=55g',
        's3a://telco-cdl-user/pdubey/Ceph_S3_Data_Read_PySpark.py'
],
dag=dag
)

amazon_data_review