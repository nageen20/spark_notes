### What is Apache Spark?
A distributed computing platform.

### What do we do with Spark?
We create programs in Spark and execute them on cluster.

### How to execute Spark Programs?
The answer to this is not so simple and straight-forward. We must understand Spark architecture and execution model.

We have two methods run Spark Programs:
- Interactive Clients
- Submit Job

#### Interactive Clients
We have seen command line spark-shell and interactive web-notebooks. Both the methods lets you run the code line-by-line and returns the output. This is used for learning and development phase. 

#### Submit Job
In the production environment we package all the spark code and submit it to the spark cluster for execution. Apache spark comes with a spark-submit utility that allows you to submit the program to the cluster. We have other alternatives, like Databricks allows you to submit notebooks directly. But these are vendor specific. spark-submit is universally accepted method and works every where.

### How Spark Distributed Processing Model Works?
Spark applies a marter-slave architecture to every application. When a application is submitted to the Spark cluster, it creates a Master process for your application. This then creates a bunch of slaves to distrubute the work and get the work done. These Slaves are run-time containers with some dedicated CPU and memory.
In spark terminology, Master is called Driver and the slaves are the Executors. Every Spark application applies the master-slave architecture and runs independently on the cluster. Please note here we are talking about the applications and how they follow master slave architecture and not about the nodes in the cluster. Below is how the architecture looks.

![image info](images/01_spark_processing_model.png)

### Spark execution modes:
- Client mode
- Cluster mode

### How does spark run applications in local machine when there is no actual cluster?
Spark uses cluster managers like local[n], YARN, MESOS, Kubernetes or Standalone to manage the clusters. In a local machine, the cluster is set to local[n] which means spark is running on local machine and the [n] denotes the number of threads it creates. In local machine, spark simulates a cluster by creating multiple threads mentioned in the spark.master config as local[n]. If n=1, then only a Driver is created and the driver handles everything and there is no parallelization. If n=3, then the application creates one master and 2 executors.

### How does spark run on an actual cluster in client mode?
The most commonly used spark cluster manager is YARN. When we are in client mode i.e. we are running spark code either in notebooks or shell, then the Driver is created on the client machine and the executors are created on the cluster. So, when the client machine disconnects from the cluster, the Driver is killed and hence the executors on the cluster are also killed. So, we can use client mode only for development purpose and not for long running jobs.

### How does spark work in cluster mode?
In cluster mode, when a spark application is submitted via spark-submit, both the Driver and Executors are created on the cluster. As a result, the client machine doesn't have to be connected to the cluster and the jobs are executed on the cluster.
