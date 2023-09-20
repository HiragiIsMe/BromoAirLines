namespace BromoAirLines
{
    partial class MasterMaskapai
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
            System.Windows.Forms.Label perusahaanLabel;
            System.Windows.Forms.Label namaLabel;
            System.Windows.Forms.Label deskripsiLabel1;
            System.Windows.Forms.Label jumlahKruLabel;
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.perusahaanTextBox = new System.Windows.Forms.TextBox();
            this.namaTextBox = new System.Windows.Forms.TextBox();
            this.deskripsiRichTextBox = new System.Windows.Forms.RichTextBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column6 = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Column7 = new System.Windows.Forms.DataGridViewButtonColumn();
            this.jumlahKruNumericUpDown = new System.Windows.Forms.NumericUpDown();
            perusahaanLabel = new System.Windows.Forms.Label();
            namaLabel = new System.Windows.Forms.Label();
            deskripsiLabel1 = new System.Windows.Forms.Label();
            jumlahKruLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.jumlahKruNumericUpDown)).BeginInit();
            this.SuspendLayout();
            // 
            // perusahaanLabel
            // 
            perusahaanLabel.AutoSize = true;
            perusahaanLabel.Location = new System.Drawing.Point(35, 429);
            perusahaanLabel.Name = "perusahaanLabel";
            perusahaanLabel.Size = new System.Drawing.Size(83, 16);
            perusahaanLabel.TabIndex = 9;
            perusahaanLabel.Text = "Perusahaan:";
            // 
            // namaLabel
            // 
            namaLabel.AutoSize = true;
            namaLabel.Location = new System.Drawing.Point(35, 389);
            namaLabel.Name = "namaLabel";
            namaLabel.Size = new System.Drawing.Size(47, 16);
            namaLabel.TabIndex = 7;
            namaLabel.Text = "Nama:";
            // 
            // deskripsiLabel1
            // 
            deskripsiLabel1.AutoSize = true;
            deskripsiLabel1.Location = new System.Drawing.Point(426, 386);
            deskripsiLabel1.Name = "deskripsiLabel1";
            deskripsiLabel1.Size = new System.Drawing.Size(67, 16);
            deskripsiLabel1.TabIndex = 13;
            deskripsiLabel1.Text = "Deskripsi:";
            // 
            // jumlahKruLabel
            // 
            jumlahKruLabel.AutoSize = true;
            jumlahKruLabel.Location = new System.Drawing.Point(35, 468);
            jumlahKruLabel.Name = "jumlahKruLabel";
            jumlahKruLabel.Size = new System.Drawing.Size(75, 16);
            jumlahKruLabel.TabIndex = 25;
            jumlahKruLabel.Text = "Jumlah Kru:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(22, 43);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(388, 20);
            this.label2.TabIndex = 4;
            this.label2.Text = "Semua maskapai yang terdaftar akan muncul disini";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(20, 12);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(235, 31);
            this.label1.TabIndex = 3;
            this.label1.Text = "Master Maskapai";
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.button2.FlatAppearance.BorderSize = 0;
            this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(644, 516);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(107, 45);
            this.button2.TabIndex = 23;
            this.button2.Text = "Batal";
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.ButtonShadow;
            this.button1.FlatAppearance.BorderSize = 0;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(499, 516);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(106, 45);
            this.button1.TabIndex = 22;
            this.button1.Text = "Simpan";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // perusahaanTextBox
            // 
            this.perusahaanTextBox.Location = new System.Drawing.Point(124, 426);
            this.perusahaanTextBox.Name = "perusahaanTextBox";
            this.perusahaanTextBox.Size = new System.Drawing.Size(258, 22);
            this.perusahaanTextBox.TabIndex = 10;
            // 
            // namaTextBox
            // 
            this.namaTextBox.Location = new System.Drawing.Point(124, 386);
            this.namaTextBox.Name = "namaTextBox";
            this.namaTextBox.Size = new System.Drawing.Size(258, 22);
            this.namaTextBox.TabIndex = 8;
            // 
            // deskripsiRichTextBox
            // 
            this.deskripsiRichTextBox.Location = new System.Drawing.Point(499, 383);
            this.deskripsiRichTextBox.Name = "deskripsiRichTextBox";
            this.deskripsiRichTextBox.Size = new System.Drawing.Size(344, 107);
            this.deskripsiRichTextBox.TabIndex = 14;
            this.deskripsiRichTextBox.Text = "";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.Column2,
            this.Column3,
            this.Column4,
            this.Column5,
            this.Column6,
            this.Column7});
            this.dataGridView1.Location = new System.Drawing.Point(26, 75);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(817, 282);
            this.dataGridView1.TabIndex = 24;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // Column1
            // 
            this.Column1.HeaderText = "ID";
            this.Column1.MinimumWidth = 6;
            this.Column1.Name = "Column1";
            this.Column1.Visible = false;
            // 
            // Column2
            // 
            this.Column2.HeaderText = "Nama";
            this.Column2.MinimumWidth = 6;
            this.Column2.Name = "Column2";
            // 
            // Column3
            // 
            this.Column3.HeaderText = "Perusahaan";
            this.Column3.MinimumWidth = 6;
            this.Column3.Name = "Column3";
            // 
            // Column4
            // 
            this.Column4.HeaderText = "Jumlah Kru";
            this.Column4.MinimumWidth = 6;
            this.Column4.Name = "Column4";
            // 
            // Column5
            // 
            this.Column5.HeaderText = "Deskripsi";
            this.Column5.MinimumWidth = 6;
            this.Column5.Name = "Column5";
            // 
            // Column6
            // 
            this.Column6.HeaderText = "";
            this.Column6.MinimumWidth = 6;
            this.Column6.Name = "Column6";
            this.Column6.Text = "Update";
            this.Column6.UseColumnTextForButtonValue = true;
            // 
            // Column7
            // 
            this.Column7.HeaderText = "";
            this.Column7.MinimumWidth = 6;
            this.Column7.Name = "Column7";
            this.Column7.Text = "Delete";
            this.Column7.UseColumnTextForButtonValue = true;
            // 
            // jumlahKruNumericUpDown
            // 
            this.jumlahKruNumericUpDown.Location = new System.Drawing.Point(124, 466);
            this.jumlahKruNumericUpDown.Name = "jumlahKruNumericUpDown";
            this.jumlahKruNumericUpDown.Size = new System.Drawing.Size(258, 22);
            this.jumlahKruNumericUpDown.TabIndex = 26;
            this.jumlahKruNumericUpDown.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // MasterMaskapai
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(871, 708);
            this.Controls.Add(jumlahKruLabel);
            this.Controls.Add(this.jumlahKruNumericUpDown);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(deskripsiLabel1);
            this.Controls.Add(this.deskripsiRichTextBox);
            this.Controls.Add(namaLabel);
            this.Controls.Add(this.namaTextBox);
            this.Controls.Add(perusahaanLabel);
            this.Controls.Add(this.perusahaanTextBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "MasterMaskapai";
            this.Text = "MasterMaskapai";
            this.Load += new System.EventHandler(this.MasterMaskapai_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.jumlahKruNumericUpDown)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox perusahaanTextBox;
        private System.Windows.Forms.TextBox namaTextBox;
        private System.Windows.Forms.RichTextBox deskripsiRichTextBox;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column5;
        private System.Windows.Forms.DataGridViewButtonColumn Column6;
        private System.Windows.Forms.DataGridViewButtonColumn Column7;
        private System.Windows.Forms.NumericUpDown jumlahKruNumericUpDown;
    }
}