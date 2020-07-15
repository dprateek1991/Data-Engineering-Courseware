import airflow
import time
from airflow import DAG
from airflow.contrib.operators.databricks_operator import DatabricksSubmitRunOperator
from airflow.models import Variable

args = {
    'owner': 'prateek.dubey',
    'email': ['dataengineeringe2e@gmail.com'],
    'depends_on_past': False,
    'start_date': "2020-06-18"
}

with DAG(dag_id='Airflow_Databricks_Integration', default_args=args,schedule_interval='@daily') as dag:

    new_cluster = {
        'name':'dataengineeringe2e',
        'spark_version': '7.0.x-scala2.12',
        "node_type_id": "Standard_DS12_v2",
        "driver_node_type_id": "Standard_F8s_v2",
        'num_workers': 1,
        'autoscale': {
            'min_workers': 1,
            'max_workers': 2
        },
        'custom_tags': {
            'TeamName': 'DataEngineeringE2E'
        },
        'spark_conf': {
            'spark.databricks.cluster.profile': 'serverless',
            'hive.metastore.schema.verification.record.version': 'TRUE',
            'spark.databricks.repl.allowedLanguages': 'sql,python,r',
            'spark.databricks.delta.preview.enabled': 'TRUE'
        },
        "docker_image": {
            "url": "dataengineeringe2e.azurecr.io/dataengineeringe2e:latest",
            "basic_auth": {
                "username": Variable.get("dataengineeringe2e_sp_client_id"),
                "password": Variable.get("dataengineeringe2e_sp_password"),
            }
        },
    }
    notebook_task_params = {
        'new_cluster': new_cluster,
        'notebook_task': {
            'notebook_path': '/dataengineeringe2e@gmail.com/Airflow_Databricks_Integration',
        }
    }
    # Example of using the JSON parameter to initialize the operator.
    notebook_task = DatabricksSubmitRunOperator(
        task_id='Airflow_Databricks_Integration',
        databricks_conn_id='databricks_default',
        dag=dag,
        json=notebook_task_params)