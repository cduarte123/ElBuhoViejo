using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace wpf_ElBuhoViejo
{
    /// <summary>
    /// Lógica de interacción para w_Autor.xaml
    /// </summary>
    public partial class w_Autor : Window
    {

        BibliotecaVirtualEntities datos;
        public w_Autor()
        {
            InitializeComponent();
            datos = new BibliotecaVirtualEntities();
        }



        private void CargarGrilla()
        {
            try
            {

                dgAutor.ItemsSource = datos.Autor.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            CargarGrilla();

            /*cboPais.ItemsSource = datos.Nacionalidad.ToList();
            cboPais.DisplayMemberPath = "Descripcion";
            cboPais.SelectedValuePath = "idNacionalidad";*/
        }

        private void BtnLimpiar_Click(object sender, RoutedEventArgs e)
        {
            txtId.Text = String.Empty;
            txtNombre.Text = String.Empty;
            txtApellido.Text = String.Empty;
            dtpFecha.DisplayDate = DateTime.Now;
            //cboPais.SelectedIndex = -1;
        }

        private void btnEliminar_Click(object sender, RoutedEventArgs e)
        {
            if (dgAutor.SelectedItem != null)
            {
                Autor escritor = (Autor)dgAutor.SelectedItem;
                datos.Autor.Remove(escritor);
                datos.SaveChanges();
                CargarGrilla();
            }
            else
            {
                MessageBox.Show("Por favor seleccione un autor!");
            }
        }

        private void ModificacionDeAutor (object sender, RoutedEventArgs e)
        {
            if (dgAutor.SelectedItem != null)
            {
                Autor m = (Autor)dgAutor.SelectedItem;
                m.Nombre = txtNombre.Text;
                m.Apellido = txtApellido.Text;
                //m.idNacionalidad = txtNacionalidad;
                m.Fecha_Nac = dtpFecha.Text;

                datos.Entry(m).State = System.Data.Entity.EntityState.Modified;
                datos.SaveChanges();
                CargarGrilla();
            }
            else
            {
                MessageBox.Show("favor seleccione una nacionaliad");
            }
        }

        private void btnGuardar_Click(object sender, RoutedEventArgs e)
        {
            if (txtNombre.Text != String.Empty)
            {
                Autor m = new Autor();
                m.Nombre = txtNombre.Text;
                m.Apellido = txtApellido.Text;
                m.Fecha_Nac = dtpFecha.Text;
                //m.idNacionalidad = txtNacionalidad.Text;

                datos.Autor.Add(m);
                datos.SaveChanges();
                CargarGrilla();
            }

        }

        private void dgNacionalidad_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dgAutor.SelectedItem != null)
            {
                Autor m = (Autor)dgAutor.SelectedItem;

                txtNombre.Text = m.Nombre;
                txtApellido.Text = m.Apellido;
                dtpFecha.Text = m.Fecha_Nac;
                //txtNacionalidad = m.Nacionalidad;
            }
        }
    }
}
