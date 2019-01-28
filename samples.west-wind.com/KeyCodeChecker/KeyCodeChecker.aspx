<%@ Page Title="JavaScript and jQuery Key Code Checker" Language="C#"          
         MasterPageFile="~/WestWindWebToolkit.master"  ClientIDMode="Static"%>

<asp:Content ID="headers" ContentPlaceHolderID="Header" runat="server">
    <title>JavaScript and jQuery Key Code Checker</title>
    <meta name="description" content="Web based utility to examine input key codes as you type them in real time." />
    <meta name="keywords" content="keycode,JavaScript,Jscript,Html,DOM,jQuery,Event,event object,which,charCode" />
    <link href="../../Css/Westwind.css" rel="stylesheet" type="text/css" />
    <%= ScriptLoader.jQueryLink() %>   
            <style>
            .resultvalue,.resultvalue-side
            {
                width: 90px;
                height: 80px;
                background: steelblue;
                border: 1px solid navy; 
                border-radius: 5px 5px 5px 5px;
                
                float: left;
                margin: 10px;
                padding: 5px;
                color: White;
            }
            .mainvalue
            {
                font-size: 3.0em;
                font-weight: bold;
                color: Khaki;  
                margin: 7px 4px;              
                text-align: center;
            }
            .resultvalue-side
            {
                height: 305px;
                width: 110px;
            }
            .aditem
            {
                margin: 25px 0;
            }
        </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>JavaScript and jQuery Key Code Checker</h1>
    <div class="toolbarcontainer">
        <div style="float:right">
            <%= Westwind.Web.Services.ShareButtons.GooglePlusPlusOneButton() %>
            <%= Westwind.Web.Services.ShareButtons.ShareOnTwitter("JavaScript Key Code Checker Utility","RickStrahl") %>
        </div>
        <a href="/" class="hoverbutton"> <img src="../../css/images/home.gif" /> Home</a>
        <a href="KeyCodeChecker.aspx" class="hoverbutton"> <img src="../../css/images/refresh.gif" /> Refresh</a>
        <a href="http://www.west-wind.com/weblog/posts/2011/Dec/08/A-Key-Code-Checker-for-DOM-Keyboard-Events" class="hoverbutton"><img src="../../Css/Images/Info.gif" /> Related Blog Post</a>
    </div>
    <div class="descriptionheader">
        This form lets you enter keystrokes or shift/ctr/alt+key combinations and displays 
        the relevant key codes for each of the events. For best results test in all your target
        browsers to find out which events fire and how values are returned. This example uses 
        jQuery's event handling features to normalize the event values.
    </div>
           

    <div class="contentcontainer" style="width: 800px;padding: 20px 40px;margin: 30px auto;">    
        
             <div id="rightSidebar" style="float:right; width: 180px;text-align:center; padding: 20px; padding-top: 50px;">
                    <small>brought to you by:</small>
                    <br />
                    <img src="../../images/wwtoollogo_text.gif" />                

                    <div class="aditem">
                    <script type="text/javascript"><!--
                            google_ad_client = "pub-2013123155768157";
                            /* 125x125, created 6/25/09 */
                            google_ad_slot = "0902115794";
                            google_ad_width = 125;
                            google_ad_height = 125;
                        //-->
                    </script>
                    <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
                    </script>    
                    </div>
                    
                    <div class="aditem">
                      <script type="text/javascript"><!--
                          google_ad_client = "pub-2013123155768157";
                          /* 125x125, created 6/25/09 */
                          google_ad_slot = "0902115794";
                          google_ad_width = 125;
                          google_ad_height = 125;
                        //-->
                    </script>
                    <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
                    </script>           
                    </div>        

          
            
                   <div style="vertical-align: middle;margin-top:25px;text-align: justify; font-size: 8pt;">
	                                If you find this site useful and use it frequently please consider making a donation to support this free service.<br />
    		    
	                                <div style="margin: 5px auto; text-align: center;">
	                                    <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7788398"><img src="/images/donation.gif" alt="Donate" /></a>		            		        
	                                </div>
	                </div>
            </div>

        <div id="maincontent">

        <fieldset>
            <legend>Key Code</legend>
        
            <label>Enter a key:</label>
            <input type="text" id="txtKey" name="txtKey" value="" style="width: 20px;" />

            <hr />

            <div id="divCharTyped"  style="float: right">
                <div class="resultvalue-side">
                    <label>fromCharCode (keypress):</label>
                    <div class="mainvalue">&nbsp;</div>                
                    <label>fromCharCode (keydown):</label>
                    <div class="mainvalue">&nbsp;</div>                
                    <label>fromCharCode (keyup):</label>
                    <div class="mainvalue"></div>     
                </div>
                <div style="clear:left;"></div>
                <div style="padding: 5px 20px;">
                    <asp:CheckBox runat="server" id="chkShift" Text="Shift" />
                    <br />
                    <asp:CheckBox runat="server" id="chkCtrl" Text="Ctrl" />
                    <br />
                    <asp:CheckBox runat="server" id="chkAlt" Text="Alt" />
                    <br />
                </div>
                 
            </div>

            <h3>keyCode</h3>
            <div>
                <div id="divDown" class="resultvalue">
                    <label>keydown</label>
                    <div class="mainvalue"></div>
                </div>
                <div id="divPress" class="resultvalue">
                    <label>keypress</label>
                    <div class="mainvalue"></div>
                </div>
                <div id="divUp" class="resultvalue">
                    <label>keyup</label>
                    <div class="mainvalue"></div>
                </div>
            </div>

            <div style="clear:left"></div>

            <h3>charCode</h3>
            <div>
                <div id="divCharCodeDown" class="resultvalue">
                    <label>keydown</label>
                    <div class="mainvalue"></div>
                </div>
                <div id="divCharCodePress" class="resultvalue">
                    <label>keypress</label>
                    <div class="mainvalue"></div>
                </div>
                <div id="divCharCodeUp" class="resultvalue">
                    <label>keyup</label>
                    <div class="mainvalue"></div>
                </div>
            </div>

            <div style="clear:left"></div>

            <h3>which (jquery)</h3>
            <small>Note: IE 8 and earlier doesn't support <i>which</i> natively</small>
            <div>
                <div id="divWhichDown" class="resultvalue">
                    <label>keydown</label>
                    <div class="mainvalue"></div>
                </div>
                <div id="divWhichPress" class="resultvalue">
                    <label>keypress</label>
                    <div class="mainvalue"></div>
                </div>
                <div id="divWhichUp" class="resultvalue">
                    <label>keyup</label>
                    <div class="mainvalue"></div>
                </div>
            </div>

            <div style="clear:both"></div>

            <hr />

            <div id="writemsg" >
            
            </div>
        </fieldset>            


        <fieldset>
            <legend>Notes</legend>

            <div class="containercontent">

            <h3>Event Object Support</h3>
                The examples here use jQuery to normalize the keycodes somewhat, but even with jQuery
                normalization is not smooth.
                
                
                <h3>IE8 and prior only supports keyCode</h3>
                IE 8 and earlier doesn't support the doesn't support the charCode and which properties.
                IE 9 and later implements DOM event object and has keyCode, charCode and which.

                <h3>keypress Event only fires on 'printable' characters</h3>
                The keypress event only fires when a key is pressed that results
                in some content being placed into the input field. If you press 
                navigation keys (arrows, home, back, tab etc.) keypress does not fire.
                Also, if you cancel event bubbling or return false in keydown, keypress (or keyup)
                will not fire.

                <h3>FireFox and Opera handle keypress differently than Spec</h3>
                FireFox and Opera handle keypress events differently than the spec suggests, by *always*
                firing the keypress event when any key is pressed. All other browsers fire keypress only
                when a printable character is pressed which is per W3C spec.
              
                <h3>Only keypress returns 'translated' keyCode Values that account for shifted Keys</h3>
                keypress is the only event which returns a valid keyCode that can be used with 
                String.fromCharCode() to return the true printed character including lower case and 
                shifted key characters (like ! or #). keyup and keydown only return the base key that
                was pressed plus shift codes.

                You can use <b>String.fromCharCode(e.which)</b> to extract this translated
                value. Realize this translation occurs only in keypress - keyup/keydown
                only receive the raw character codes plus shift states (ie. you get A or 1 regardless
                of whether you press the shift key or not).
            
            
            </div>
        </fieldset>
        
        </div>
    </div>
    
    <script type="text/javascript">
        $( function () {
            $("#txtKey")
                .focus()
                .keypress(handleKey)
                .keydown(handleKey)                
                .keyup(handleKey);
        });

        function handleKey(e) {            
            var keyCode = e.keyCode;
            var charCode = e.charCode;
            var which = e.which;

            var type = e.handleObj.origType;            
            var orig = e.orignalEvent;

            if (!keyCode)
                keyCode = "0";
            if (!which)
                which = "0";

            if (type == "keydown") {
                $("#divDown .mainvalue").text(keyCode);
                $("#divCharCodeDown .mainvalue").text(charCode);
                $("#divWhichDown .mainvalue").text(which);

                $("#divCharTyped .mainvalue:eq(1)")
                    .text("")
                    .text(String.fromCharCode(keyCode));

                // also clear out key press values in case it doesn't fire                
                $("#divCharTyped .mainvalue:eq(0)")
                    .html("&nbsp;")
                $("#divPress .mainvalue").text("");
                $("#divCharCodePress .mainvalue").text("");
                $("#divWhichPress .mainvalue").text("");

                $("#chkShift").prop("checked", e.shiftKey);
                $("#chkCtrl").prop("checked", e.ctrlKey);
                $("#chkAlt").prop("checked", e.altKey);
            }
            else if (type == "keypress") {                
                $("#divPress .mainvalue").text(keyCode);
                $("#divCharCodePress .mainvalue").text(charCode);
                $("#divWhichPress .mainvalue").text(which);
                
                $("#divCharTyped .mainvalue:eq(0)")
                    .text(String.fromCharCode(which));
            }
            else if (type == "keyup") {
                $("#divUp .mainvalue").text(keyCode);
                $("#divCharCodeUp .mainvalue").text(charCode);
                $("#divWhichUp .mainvalue").text(which);

                $("#divCharTyped .mainvalue:eq(2)")
                    .text("")
                    .text(String.fromCharCode(keyCode));                
            }

            

            // must return true in order for keypress to fire
            // in all browsers. Remove character using setTimeout 
            // to delay and clear text after the fact.
            setTimeout(function () { $("#txtKey").val(""); }, 2);

            // always return true so keypress fires
            return true;
        }        
    </script>
</asp:Content>