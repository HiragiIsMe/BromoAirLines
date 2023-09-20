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
    public partial class MasterBandara : Form
    {
        private int ID = 0;
        public MasterBandara()
        {
            InitializeComponent();
        }
        void onload()
        {
            ControlBox = false;
            MinimizeBox = false;
            MaximizeBox = false;
            FormBorderStyle = FormBorderStyle.None;
        }
        void loaddata()
        {
            string query = "select * from Bandara join Negara on Bandara.NegaraID = Negara.ID order by Bandara.Nama asc";
            SqlCommand cmd = new SqlCommand(query, Connection.conn);
            Connection.conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string[] rows = { reader.GetInt32(0).ToString(), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetInt32(4).ToString(), reader.GetString(8), reader.GetInt32(5).ToString(), reader.GetString(6) };
                dataGridView1.Rows.Add(rows);
            }
            Connection.conn.Close();
        }
        void loadNegara()
        {
            string query = "select * from Negara";
            comboBox1.DataSource = Connection.getData(query);
            comboBox1.DisplayMember = "Nama";
            comboBox1.ValueMember = "ID";
        }
        void clear()
        {
            ID = 0;
            namaTextBox.Text = "";
            kodeIATATextBox.Text = "";
            kotaTextBox.Text = "";
            numericUpDown1.Value = 1;
            richTextBox1.Text = "";
        }
        private void MasterBandara_Load(object sender, EventArgs e)
        {
            onload();
            loaddata();
            loadNegara();
            if (dataGridView1.Rows.Count > 0)
            {
                dataGridView1.Rows[0].Cells[1].Selected = false;
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.ColumnIndex == 8)
            {
                ID = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value);
                namaTextBox.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                kodeIATATextBox.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                kotaTextBox.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                comboBox1.SelectedValue = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[4].Value);
                comboBox1.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
                numericUpDown1.Value = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[6].Value);
                richTextBox1.Text = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();
            }
            if(e.ColumnIndex == 9)
            {
                ID = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value);
                DialogResult result = MessageBox.Show("Apakah Anda Ingin Menghapus " + dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString() + "?", "Alert", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if(result == DialogResult.OK)
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand("Delete from Bandara where ID=" + ID, Connection.conn);
                        Connection.conn.Open();
                        cmd.ExecuteNonQuery();
                        Connection.conn.Close();

                        ID = 0;
                        MessageBox.Show("Data Berhasil Dihapus!", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        dataGridView1.Rows.Clear();
                        loaddata();
                    }
                    catch(Exception ex)
                    {
                        throw;
                    }
                }
            }
        }
        bool validateIn()
        {
            if(namaTextBox.Text == "" || kodeIATATextBox.Text == "" || kotaTextBox.Text == "" || richTextBox1.Text == "")
            {
                MessageBox.Show("Semua Form Wajib Diisi", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            SqlCommand cmd = new SqlCommand("select * from Bandara where Nama=@nama", Connection.conn);
            cmd.Parameters.AddWithValue("@nama", namaTextBox.Text);
            Connection.conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            if (reader.HasRows)
            {
                Connection.conn.Close();
                MessageBox.Show("Nama Bnadara Telah Ada", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);    
                return false;
            }
            Connection.conn.Close();

            if(kodeIATATextBox.TextLength != 3)
            {
                MessageBox.Show("kode IATA harus berupa 3 huruf", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            SqlCommand cmd1 = new SqlCommand("select * from Bandara where kodeIATA=@kode", Connection.conn);
            cmd1.Parameters.AddWithValue("@kode", kodeIATATextBox.Text);
            Connection.conn.Open();
            SqlDataReader reader1 = cmd1.ExecuteReader();
            reader1.Read();
            if (reader1.HasRows)
            {
                Connection.conn.Close();
                MessageBox.Show("Kode IATA Bandara Telah Ada", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            Connection.conn.Close();

            if(numericUpDown1.Value == 0)
            {
                MessageBox.Show("Jumlah Terminal Minimal 1", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            return true;
        }

        bool validateUp()
        {
            if (namaTextBox.Text == "" || kodeIATATextBox.Text == "" || kotaTextBox.Text == "" || richTextBox1.Text == "")
            {
                MessageBox.Show("Semua Form Wajib Diisi", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            if(namaTextBox.Text != dataGridView1.SelectedRows[0].Cells[1].Value.ToString())
            {
                SqlCommand cmd = new SqlCommand("select * from Bandara where Nama=@nama", Connection.conn);
                cmd.Parameters.AddWithValue("@nama", namaTextBox.Text);
                Connection.conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                if (reader.HasRows)
                {
                    Connection.conn.Close();
                    MessageBox.Show("Nama Bnadara Telah Ada", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                Connection.conn.Close();
            }

            if (kodeIATATextBox.TextLength != 3)
            {
                MessageBox.Show("kode IATA harus berupa 3 huruf", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            if(kodeIATATextBox.Text != dataGridView1.SelectedRows[0].Cells[2].Value.ToString())
            {
                SqlCommand cmd1 = new SqlCommand("select * from Bandara where kodeIATA=@kode", Connection.conn);
                cmd1.Parameters.AddWithValue("@kode", kodeIATATextBox.Text);
                Connection.conn.Open();
                SqlDataReader reader1 = cmd1.ExecuteReader();
                reader1.Read();
                if (reader1.HasRows)
                {
                    Connection.conn.Close();
                    MessageBox.Show("Kode IATA Bandara Telah Ada", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                Connection.conn.Close();
            }

            if (numericUpDown1.Value == 0)
            {
                MessageBox.Show("Jumlah Terminal Minimal 1", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            return true;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if (ID == 0)
            {
                if (validateIn())
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand("insert into Bandara values(@nama,@kode,@kota,@negaraid,@terminal,@alamat)", Connection.conn);
                        cmd.Parameters.AddWithValue("@nama", namaTextBox.Text);
                        cmd.Parameters.AddWithValue("@kode", kodeIATATextBox.Text);
                        cmd.Parameters.AddWithValue("@kota", kotaTextBox.Text);
                        cmd.Parameters.AddWithValue("@negaraid", comboBox1.SelectedValue);
                        cmd.Parameters.AddWithValue("@terminal", numericUpDown1.Value);
                        cmd.Parameters.AddWithValue("@alamat", richTextBox1.Text);

                        Connection.conn.Open();
                        cmd.ExecuteNonQuery();
                        Connection.conn.Close();

                        MessageBox.Show("Data Berhasil Ditambah", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch(Exception ex)
                    {
                        throw;
                    }
                }
            }

            if(ID != 0)
            {
                if (validateUp())
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand("update Bandara set Nama=@nama,KodeIATA=@kode,Kota=@kota,NegaraID=@negaraid,JumlahTerminal=@terminal,Alamat=@alamat where ID="+ ID +"", Connection.conn);
                        cmd.Parameters.AddWithValue("@nama", namaTextBox.Text);
                        cmd.Parameters.AddWithValue("@kode", kodeIATATextBox.Text);
                        cmd.Parameters.AddWithValue("@kota", kotaTextBox.Text);
                        cmd.Parameters.AddWithValue("@negaraid", comboBox1.SelectedValue);
                        cmd.Parameters.AddWithValue("@terminal", numericUpDown1.Value);
                        cmd.Parameters.AddWithValue("@alamat", richTextBox1.Text);

                        Connection.conn.Open();
                        cmd.ExecuteNonQuery();
                        Connection.conn.Close();

                        MessageBox.Show("Data Berhasil DiUpdate", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        loaddata();
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }
                }
            }
            dataGridView1.Rows.Clear();
            loaddata();
            clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}
