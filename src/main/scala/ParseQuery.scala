import org.apache.spark.sql.SparkSession
import scala.io.Source

object ParseQuery {
  def main(args: Array[String]): Unit = {
    val spark = SparkSession.builder
      .master("local")
      .appName("ParseQuery")
      .getOrCreate()

    import spark.sessionState.sqlParser

    val fname = "src/resources/example1.sql"
    val sqlContent = Source.fromFile(fname).mkString

    val logicalPlan = sqlParser.parsePlan(sqlContent)

    val a = 1
  }

}
