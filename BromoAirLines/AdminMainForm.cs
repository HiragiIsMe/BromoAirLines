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
    }
}
