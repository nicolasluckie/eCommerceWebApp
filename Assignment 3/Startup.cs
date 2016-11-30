using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Assignment_3.Startup))]
namespace Assignment_3
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
