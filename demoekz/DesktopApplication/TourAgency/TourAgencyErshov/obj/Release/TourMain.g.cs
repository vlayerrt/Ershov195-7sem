﻿#pragma checksum "..\..\TourMain.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "45DE1D7CDA43F5888CECE3E4229B78D1BD91E12554F4815B858BB971BB4EEA19"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using TourAgencyErshov;


namespace TourAgencyErshov {
    
    
    /// <summary>
    /// TourMain
    /// </summary>
    public partial class TourMain : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 14 "..\..\TourMain.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Border rowone;
        
        #line default
        #line hidden
        
        
        #line 18 "..\..\TourMain.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Admin_btn;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\TourMain.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button User_btn;
        
        #line default
        #line hidden
        
        
        #line 20 "..\..\TourMain.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Hotels_btn;
        
        #line default
        #line hidden
        
        
        #line 22 "..\..\TourMain.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Exit_btn;
        
        #line default
        #line hidden
        
        
        #line 24 "..\..\TourMain.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Frame FrameMain;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/TourAgencyErshov;component/tourmain.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\TourMain.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.rowone = ((System.Windows.Controls.Border)(target));
            return;
            case 2:
            this.Admin_btn = ((System.Windows.Controls.Button)(target));
            
            #line 18 "..\..\TourMain.xaml"
            this.Admin_btn.Click += new System.Windows.RoutedEventHandler(this.Adm_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.User_btn = ((System.Windows.Controls.Button)(target));
            
            #line 19 "..\..\TourMain.xaml"
            this.User_btn.Click += new System.Windows.RoutedEventHandler(this.Usr_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.Hotels_btn = ((System.Windows.Controls.Button)(target));
            
            #line 20 "..\..\TourMain.xaml"
            this.Hotels_btn.Click += new System.Windows.RoutedEventHandler(this.Htl_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.Exit_btn = ((System.Windows.Controls.Button)(target));
            
            #line 22 "..\..\TourMain.xaml"
            this.Exit_btn.Click += new System.Windows.RoutedEventHandler(this.Exit_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.FrameMain = ((System.Windows.Controls.Frame)(target));
            
            #line 24 "..\..\TourMain.xaml"
            this.FrameMain.ContentRendered += new System.EventHandler(this.FrameBackBtn);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

