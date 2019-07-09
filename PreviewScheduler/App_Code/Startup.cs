using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GetToShape.Startup))]
namespace GetToShape
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
