import org.apache.spark.sql.SparkSession


object ParseQuery {
  val spark = SparkSession.builder
    .master("local")
    .appName("ParseQuery")
    .getOrCreate()


}
