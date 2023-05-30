using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BromoAirLines
{
    class Connection
    {
        private static string connection = @"Data Source=DESKTOP-0GM6JSL\SQLEXPRESS;Initial Catalog=BromoAirlines;Integrated Security=True";
        
        public static SqlConnection conn = new SqlConnection(connection);

        public static DataTable getData(string query)
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            conn.Close();

            return dt;
        }
    }

    class Model
    {
        public static int ID { set; get; }
        public static string Name { set; get; }
        public static int Role { set; get; }
    }
}
