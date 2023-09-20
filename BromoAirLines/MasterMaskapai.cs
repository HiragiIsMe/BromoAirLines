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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace BromoAirLines
{
    public partial class MasterMaskapai : Form
    {
        private int ID = 0;
        public MasterMaskapai()
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
        void loadData()
        {
            string query = "select * from Maskapai order by Nama asc";
            SqlCommand cmd = new SqlCommand(query, Connection.conn);
            Connection.conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string[] data = { reader.GetInt32(0).ToString(), reader.GetString(1), reader.GetString(2), reader.GetInt32(3).ToString(), reader.GetString(4) };
                dataGridView1.Rows.Add(data);
            }
            Connection.conn.Close();
            dataGridView1.Columns[0].Visible = false;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }
        private void MasterMaskapai_Load(object sender, EventArgs e)
        {
            loadData();
            onload();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.ColumnIndex == 5)
            {
                ID = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value);
                namaTextBox.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                perusahaanTextBox.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                jumlahKruNumericUpDown.Value = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[3].Value);
                deskripsiRichTextBox.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            }

            if(e.ColumnIndex == 6)
            {
                ID = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value);
                DialogResult result = MessageBox.Show("Apakah Anda Ingin Menghapus " + dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString() + "?", "Alert", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (result == DialogResult.OK)
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand("Delete from Maskapai where ID=" + ID, Connection.conn);
                        Connection.conn.Open();
                        cmd.ExecuteNonQuery();
                        Connection.conn.Close();

                        ID = 0;
                        MessageBox.Show("Data Berhasil Dihapus!", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        dataGridView1.Rows.Clear();
                        loadData();
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }
                }
            }
        }
        void clear()
        {
            ID = 0;
            namaTextBox.Text = "";
            perusahaanTextBox.Text = "";
            jumlahKruNumericUpDown.Value = 1;
            deskripsiRichTextBox.Text = "";
        }
        private void button2_Click(object sender, EventArgs e)
        {
            clear();
        }
        bool validate()
        {
            if (jumlahKruNumericUpDown.Value == 0)
            {
                MessageBox.Show("Jumlah Kru Minimal 1", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if (ID == 0)
            {
                if (validate())
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand("insert into Maskapai values(@nama,@perusahaan,@jumlahkru,@deskripsi)", Connection.conn);
                        cmd.Parameters.AddWithValue("@nama", namaTextBox.Text);
                        cmd.Parameters.AddWithValue("@perusahaan", perusahaanTextBox.Text);
                        cmd.Parameters.AddWithValue("@jumlahkru", jumlahKruNumericUpDown.Value);
                        cmd.Parameters.AddWithValue("@deskripsi", deskripsiRichTextBox.Text);

                        Connection.conn.Open();
                        cmd.ExecuteNonQuery();
                        Connection.conn.Close();

                        MessageBox.Show("Data Berhasil Ditambah", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }
                }
            }

            if (ID != 0)
            {
                if (validate())
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand("update Maskapai set Nama=@nama,Perusahaan=@perusahaan,JumlahKru=@jumlahkru,Deskripsi=@deskripsi where ID=" + ID + "", Connection.conn);
                        cmd.Parameters.AddWithValue("@nama", namaTextBox.Text);
                        cmd.Parameters.AddWithValue("@perusahaan", perusahaanTextBox.Text);
                        cmd.Parameters.AddWithValue("@jumlahkru", jumlahKruNumericUpDown.Value);
                        cmd.Parameters.AddWithValue("@deskripsi", deskripsiRichTextBox.Text);

                        Connection.conn.Open();
                        cmd.ExecuteNonQuery();
                        Connection.conn.Close();

                        MessageBox.Show("Data Berhasil DiUpdate", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (Exception ex)
                    {
                        throw;
                    }
                }
            }
            dataGridView1.Rows.Clear();
            loadData();
            clear();
        }
    }
}
