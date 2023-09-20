namespace BromoAirLines
{
    partial class MasterBandara
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.Label namaLabel;
            System.Windows.Forms.Label kodeIATALabel;
            System.Windows.Forms.Label kotaLabel;
            System.Windows.Forms.Label jumlahTerminalLabel;
            System.Windows.Forms.Label alamatLabel;
            System.Windows.Forms.Label label3;
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nama = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kodeiata = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kota = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.idnegara = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.negara = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.jumlahterminal = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.alamat = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.up = new System.Windows.Forms.DataGridViewButtonColumn();
            this.del = new System.Windows.Forms.DataGridViewButtonColumn();
            this.namaTextBox = new System.Windows.Forms.TextBox();
            this.kodeIATATextBox = new System.Windows.Forms.TextBox();
            this.kotaTextBox = new System.Windows.Forms.TextBox();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            namaLabel = new System.Windows.Forms.Label();
            kodeIATALabel = new System.Windows.Forms.Label();
            kotaLabel = new System.Windows.Forms.Label();
            jumlahTerminalLabel = new System.Windows.Forms.Label();
            alamatLabel = new System.Windows.Forms.Label();
            label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            this.SuspendLayout();
            // 
            // namaLabel
            // 
            namaLabel.AutoSize = true;
            namaLabel.Location = new System.Drawing.Point(28, 429);
            namaLabel.Name = "namaLabel";
            namaLabel.Size = new System.Drawing.Size(47, 16);
            namaLabel.TabIndex = 6;
            namaLabel.Text = "Nama:";
            // 
            // kodeIATALabel
            // 
            kodeIATALabel.AutoSize = true;
            kodeIATALabel.Location = new System.Drawing.Point(28, 466);
            kodeIATALabel.Name = "kodeIATALabel";
            kodeIATALabel.Size = new System.Drawing.Size(75, 16);
            kodeIATALabel.TabIndex = 8;
            kodeIATALabel.Text = "Kode IATA:";
            // 
            // kotaLabel
            // 
            kotaLabel.AutoSize = true;
            kotaLabel.Location = new System.Drawing.Point(28, 503);
            kotaLabel.Name = "kotaLabel";
            kotaLabel.Size = new System.Drawing.Size(37, 16);
            kotaLabel.TabIndex = 10;
            kotaLabel.Text = "Kota:";
            // 
            // jumlahTerminalLabel
            // 
            jumlahTerminalLabel.AutoSize = true;
            jumlahTerminalLabel.Location = new System.Drawing.Point(443, 426);
            jumlahTerminalLabel.Name = "jumlahTerminalLabel";
            jumlahTerminalLabel.Size = new System.Drawing.Size(109, 16);
            jumlahTerminalLabel.TabIndex = 14;
            jumlahTerminalLabel.Text = "Jumlah Terminal:";
            // 
            // alamatLabel
            // 
            alamatLabel.AutoSize = true;
            alamatLabel.Location = new System.Drawing.Point(443, 460);
            alamatLabel.Name = "alamatLabel";
            alamatLabel.Size = new System.Drawing.Size(52, 16);
            alamatLabel.TabIndex = 16;
            alamatLabel.Text = "Alamat:";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new System.Drawing.Point(28, 540);
            label3.Name = "label3";
            label3.Size = new System.Drawing.Size(56, 16);
            label3.TabIndex = 19;
            label3.Text = "Negara:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(23, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(220, 31);
            this.label1.TabIndex = 0;
            this.label1.Text = "Master Bandara";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(25, 51);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(377, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "Semua bandara yang terdaftar akan muncul disini";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.id,
            this.nama,
            this.kodeiata,
            this.kota,
            this.idnegara,
            this.negara,
            this.jumlahterminal,
            this.alamat,
            this.up,
            this.del});
            this.dataGridView1.Location = new System.Drawing.Point(29, 85);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(816, 297);
            this.dataGridView1.TabIndex = 2;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // id
            // 
            this.id.HeaderText = "id";
            this.id.MinimumWidth = 6;
            this.id.Name = "id";
            this.id.Visible = false;
            // 
            // nama
            // 
            this.nama.HeaderText = "Nama";
            this.nama.MinimumWidth = 6;
            this.nama.Name = "nama";
            // 
            // kodeiata
            // 
            this.kodeiata.HeaderText = "KodeIATA";
            this.kodeiata.MinimumWidth = 6;
            this.kodeiata.Name = "kodeiata";
            // 
            // kota
            // 
            this.kota.HeaderText = "Kota";
            this.kota.MinimumWidth = 6;
            this.kota.Name = "kota";
            // 
            // idnegara
            // 
            this.idnegara.HeaderText = "idnegara";
            this.idnegara.MinimumWidth = 6;
            this.idnegara.Name = "idnegara";
            this.idnegara.Visible = false;
            // 
            // negara
            // 
            this.negara.HeaderText = "Negara";
            this.negara.MinimumWidth = 6;
            this.negara.Name = "negara";
            // 
            // jumlahterminal
            // 
            this.jumlahterminal.HeaderText = "JumlahTerminal";
            this.jumlahterminal.MinimumWidth = 6;
            this.jumlahterminal.Name = "jumlahterminal";
            // 
            // alamat
            // 
            this.alamat.HeaderText = "Alamat";
            this.alamat.MinimumWidth = 6;
            this.alamat.Name = "alamat";
            // 
            // up
            // 
            this.up.HeaderText = "";
            this.up.MinimumWidth = 6;
            this.up.Name = "up";
            this.up.Text = "Update";
            this.up.UseColumnTextForButtonValue = true;
            // 
            // del
            // 
            this.del.HeaderText = "";
            this.del.MinimumWidth = 6;
            this.del.Name = "del";
            this.del.Text = "Delete";
            this.del.UseColumnTextForButtonValue = true;
            // 
            // namaTextBox
            // 
            this.namaTextBox.Location = new System.Drawing.Point(143, 426);
            this.namaTextBox.Name = "namaTextBox";
            this.namaTextBox.Size = new System.Drawing.Size(259, 22);
            this.namaTextBox.TabIndex = 7;
            // 
            // kodeIATATextBox
            // 
            this.kodeIATATextBox.Location = new System.Drawing.Point(143, 463);
            this.kodeIATATextBox.Name = "kodeIATATextBox";
            this.kodeIATATextBox.Size = new System.Drawing.Size(259, 22);
            this.kodeIATATextBox.TabIndex = 9;
            // 
            // kotaTextBox
            // 
            this.kotaTextBox.Location = new System.Drawing.Point(143, 500);
            this.kotaTextBox.Name = "kotaTextBox";
            this.kotaTextBox.Size = new System.Drawing.Size(259, 22);
            this.kotaTextBox.TabIndex = 11;
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(558, 460);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(252, 96);
            this.richTextBox1.TabIndex = 17;
            this.richTextBox1.Text = "";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(143, 537);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(259, 24);
            this.comboBox1.TabIndex = 18;
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.button1.FlatAppearance.BorderSize = 0;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(558, 574);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(106, 45);
            this.button1.TabIndex = 20;
            this.button1.Text = "Simpan";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.button2.FlatAppearance.BorderSize = 0;
            this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(703, 574);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(107, 45);
            this.button2.TabIndex = 21;
            this.button2.Text = "Batal";
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Location = new System.Drawing.Point(558, 426);
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(252, 22);
            this.numericUpDown1.TabIndex = 22;
            this.numericUpDown1.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // MasterBandara
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(871, 708);
            this.Controls.Add(this.numericUpDown1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(label3);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(namaLabel);
            this.Controls.Add(this.namaTextBox);
            this.Controls.Add(kodeIATALabel);
            this.Controls.Add(this.kodeIATATextBox);
            this.Controls.Add(kotaLabel);
            this.Controls.Add(this.kotaTextBox);
            this.Controls.Add(jumlahTerminalLabel);
            this.Controls.Add(alamatLabel);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "MasterBandara";
            this.Text = "MasterBandara";
            this.Load += new System.EventHandler(this.MasterBandara_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn id;
        private System.Windows.Forms.DataGridViewTextBoxColumn nama;
        private System.Windows.Forms.DataGridViewTextBoxColumn kodeiata;
        private System.Windows.Forms.DataGridViewTextBoxColumn kota;
        private System.Windows.Forms.DataGridViewTextBoxColumn idnegara;
        private System.Windows.Forms.DataGridViewTextBoxColumn negara;
        private System.Windows.Forms.DataGridViewTextBoxColumn jumlahterminal;
        private System.Windows.Forms.DataGridViewTextBoxColumn alamat;
        private System.Windows.Forms.DataGridViewButtonColumn up;
        private System.Windows.Forms.DataGridViewButtonColumn del;
        private System.Windows.Forms.TextBox namaTextBox;
        private System.Windows.Forms.TextBox kodeIATATextBox;
        private System.Windows.Forms.TextBox kotaTextBox;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
    }
}