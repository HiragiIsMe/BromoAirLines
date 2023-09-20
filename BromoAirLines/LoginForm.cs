using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BromoAirLines
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }
        void onload()
        {
            this.CenterToScreen();
            textBox2.UseSystemPasswordChar = true;
        }
        private void LoginForm_Load(object sender, EventArgs e)
        {
            onload();
        }
        bool validate()
        {
            if(textBox1.Text == "" || textBox2.Text == "")
            {
                MessageBox.Show("Username Dan Password Wajib Diisi", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            if(textBox2.TextLength < 8)
            {
                MessageBox.Show("Password Harus Lebih Dari 8 Character", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            return true;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if (validate())
            {
                SqlCommand cmd = new SqlCommand("select * from Akun where Username=@username and Password=@password", Connection.conn);
                cmd.Parameters.AddWithValue("@username", textBox1.Text);
                cmd.Parameters.AddWithValue("@password", textBox2.Text);
                Connection.conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();

                if (reader.HasRows)
                {
                    Model.ID = Convert.ToInt32(reader["ID"]);
                    Model.Name = reader["Nama"].ToString();
                    Model.Role = Convert.ToInt32(reader["MerupakanAdmin"]);

                    if (Model.Role == 1)
                    {
                        Connection.conn.Close();
                        this.Hide();
                        AdminMainForm form = new AdminMainForm();
                        form.Show();
                    }

                    if (Model.Role == 0)
                    {
                        Connection.conn.Close();
                        this.Hide();
                        CustomerMainForm form = new CustomerMainForm();
                        form.Show();
                    }
                }
                else
                {
                    MessageBox.Show("Akun Tidak Ditemukan", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                Connection.conn.Close();
            }
        }

        private void label4_Click(object sender, EventArgs e)
        {
            this.Hide();
            DaftarAkunForm form = new DaftarAkunForm();
            form.Show();
        }
    }
}
