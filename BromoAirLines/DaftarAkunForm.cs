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
    public partial class DaftarAkunForm : Form
    {
        public DaftarAkunForm()
        {
            InitializeComponent();
        }

        private void DaftarAkunForm_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();
            textBox4.UseSystemPasswordChar = true;
        }

        private void label8_Click(object sender, EventArgs e)
        {
            this.Close();
            LoginForm loginForm = new LoginForm();
            loginForm.Show();
        }

        private void DaftarAkunForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            LoginForm loginForm = new LoginForm();
            loginForm.Show();
        }
        bool validate()
        {
            if(textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "" || dateTimePicker1.Value == null)
            {
                MessageBox.Show("Semua Form Wajib Diisi", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            SqlCommand cmd = new SqlCommand("select Username from Akun where Username=@username", Connection.conn);
            cmd.Parameters.AddWithValue("@username", textBox1.Text);
            Connection.conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            if(reader.HasRows)
            {
                Connection.conn.Close();
                MessageBox.Show("Username Telah Digunakan", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            else
            {
                Connection.conn.Close();
            }

            if(textBox3.TextLength < 10 && textBox3.TextLength > 15)
            {
                MessageBox.Show("Nomor Telepon Harus 10-15 Digit Angka", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            if(textBox4.TextLength < 8)
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
                SqlCommand cmd = new SqlCommand("insert into Akun values(@username,@password,@nama,@tggl,@telepon,0)", Connection.conn);
                cmd.Parameters.AddWithValue("@username", textBox1.Text);
                cmd.Parameters.AddWithValue("@password", textBox4.Text);
                cmd.Parameters.AddWithValue("@nama", textBox2.Text);
                cmd.Parameters.AddWithValue("@tggl", dateTimePicker1.Value);
                cmd.Parameters.AddWithValue("@telepon", textBox3.Text);

                Connection.conn.Open();
                cmd.ExecuteNonQuery();
                Connection.conn.Close();

                MessageBox.Show("Akun Berhasil Di Daftarkan", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Information);

                this.Hide();
                CustomerMainForm form1 = new CustomerMainForm();
                form1.Show();
            }
        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            if(!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar)) 
            {
                e.Handled = true;
            }
        }
    }
}
