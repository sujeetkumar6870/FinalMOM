using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Jasmine.Startup))]
namespace Jasmine
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
