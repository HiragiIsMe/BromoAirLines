using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BromoAirLines
{
    public partial class AdminMainForm : Form
    {
        bool expand = true;
        public AdminMainForm()
        {
            InitializeComponent();
        }

        private void AdminMainForm_Load(object sender, EventArgs e)
        {
            this.CenterToScreen();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (expand)
            {
                panelSide.Width -= 100;
                if(panelSide.Width == panelSide.MinimumSize.Width)
                {
                    expand = false;
                    timer1.Stop();
                }
            }
            else
            {
                panelSide.Width += 100;
                if (panelSide.Width == panelSide.MaximumSize.Width)
                {
                    expand = true;
                    timer1.Stop();
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            timer1.Start();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Are You To LogOut?", "Alert", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if(result == DialogResult.OK)
            {
                this.Close();
                LoginForm form = new LoginForm();
                form.Show();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MasterBandara form = new MasterBandara()
            {
                TopLevel = false,
                TopMost = true
            };
            panelMain.Controls.Clear();
            panelMain.Controls.Add(form);
            form.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            MasterMaskapai form = new MasterMaskapai()
            {
                TopLevel = false,
                TopMost = true
            };
            panelMain.Controls.Clear();
            panelMain.Controls.Add(form);
            form.Show();
        }

        private void AdminMainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult result = MessageBox.Show("Are You To Exit?", "Alert", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (result == DialogResult.OK)
            {
                Application.Exit();
            }
        }
    }
}
