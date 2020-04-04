using System;
using System.Reflection;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace App.Extensions
{
    /// <summary>
    /// Extension de Markup para recuperar uma imagem do projeto comum android/ios.
    /// </summary>
    /// <remarks>Baseado em uma solução demo da documentação</remarks>
    /// <see cref="https://github.com/xamarin/xamarin-forms-samples/blob/master/UserInterface/VisualDemos/VisualDemos/ImageResourceExtension.cs"/>
    [ContentProperty(nameof(Source))]
    public class EmbeddedImageExtension : IMarkupExtension
    {
        public string Source { get; set; }

        public object ProvideValue(IServiceProvider serviceProvider)
        {
            if (Source == null)
            {
                return null;
            }

            var imageSource = ImageSource.FromResource(Source, typeof(EmbeddedImageExtension).GetTypeInfo().Assembly);
            return imageSource;
        }
    }
}
