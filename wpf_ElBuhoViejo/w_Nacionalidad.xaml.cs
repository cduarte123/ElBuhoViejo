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
    /// Lógica de interacción para w_Nacionalidad.xaml
    /// </summary>
    public partial class w_Nacionalidad : Window

    {

        BibliotecaVirtualEntities datos;
        public w_Nacionalidad()
        {
            InitializeComponent();
            datos = new BibliotecaVirtualEntities();
        }



        private void CargarGrilla()
        {
            try
            {
              
                dgNacionalidad.ItemsSource = datos.Nacionalidad.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            CargarGrilla();
        }

        private void btnGuardar_Click(object sender, RoutedEventArgs e)
        {
            Nacionalidad m = new Nacionalidad();
            m.Descripcion = txtDescripcion.Text;

            datos.Nacionalidad.Add(m);
            datos.SaveChanges();
            CargarGrilla();

        }

        private void btnEliminar_Click(object sender, RoutedEventArgs e)
        {
            if (dgNacionalidad.SelectedItem != null)
            {
                Nacionalidad m = (Nacionalidad)dgNacionalidad.SelectedItem;
                datos.Nacionalidad.Remove(m);
                datos.SaveChanges();
                CargarGrilla();
            }
        }

        private void dgNacionalidad_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dgNacionalidad.SelectedItem != null)
            {
                Nacionalidad m = (Nacionalidad)dgNacionalidad.SelectedItem;

                txtId.Text = m.idNacionalidad.ToString();
                txtDescripcion.Text = m.Descripcion;

            }
        }

        private void ModificacionDeMaterial(object sender, RoutedEventArgs e)
        {
            if (dgNacionalidad.SelectedItem != null)
            {
                Nacionalidad m = (Nacionalidad)dgNacionalidad.SelectedItem;
                m.Descripcion = txtDescripcion.Text;

                datos.Entry(m).State = System.Data.Entity.EntityState.Modified;
                datos.SaveChanges();
                CargarGrilla();

            }
        }

        private void BtnLimpiar_Click(object sender, RoutedEventArgs e)
        {
            txtId.Text = txtDescripcion.Text = string.Empty;
        }



    }
}
