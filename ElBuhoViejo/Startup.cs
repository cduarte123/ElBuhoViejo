using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ElBuhoViejo.Startup))]
namespace ElBuhoViejo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
