/*
 ### jQuery Multiple File Upload Plugin v1.27 - 2008-03-29 ###
 * http://www.fyneworks.com/ - diego@fyneworks.com
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 ###
 Project: http://jquery.com/plugins/project/MultiFile/
 Website: http://www.fyneworks.com/jquery/multiple-file-upload/
 Forums:  http://www.nabble.com/jQuery-Multiple-File-Upload-f20931.html
*/
/*
 CHANGE LOG:
  12-April-2007: v1.1
  Added events and file extension validation
  See website for details.
  
  06-June-2007: v1.2
  Now works in Opera.
  
  12-June-2007: v1.21
  Preserves name of file input so all current server-side
  functions don't need to be changed on new installations.
  
  24-June-2007: v1.22
  Now works perfectly in Opera, thanks to Adrian Wróbel <adrian [dot] wrobel [at] gmail.com>
  
  10-Jan-2008: v1.24
  Fixed bug in event trigger - sending incorrect parameters to event handlers
  
  14-Jan-2008: v1.24
  Fixed bug 1251: http://plugins.jquery.com/project/comments/add/1251
  
  25-Jan-2008: v1.24
  Implemented feature request: http://plugins.jquery.com/node/1363
  The plugin now automatically intercepts ajaxSubmit function (form plugin)
  and disbales empty file input elements for submission
  
  08-Feb-2008: v1.25
  Fixed bug: http://plugins.jquery.com/node/1495
  The last change caused the plugin to disabled input files that shouldn't have been ignored
  Now, every newly created input file (by this plugin) is marked by the MultiFile class.
  
  11-Feb-2008: v1.25
  Fixed bug: http://plugins.jquery.com/node/1495
  Plugin would override element ID everytime.
  
  11-Feb-2008: v1.26
  Modified plugin structure. After selecting and removing a file, the plugin would
  remove the original element from DOM. Now the plugin works back on its own tracks
  and removes the last generated element.
  This will resolve compatibility issues with validation plugins and custom code.
  
  12-Feb-2008: v1.26
  Try to clear elements using the browser's native behaviour: .reset()
  This works around security policies in IE6 and Opera.
  
  17-Mar-2008: v1.27
  Added properties/methods for easier form integration
  $.MultiFile.autoIntercept - array of known jQuery plugins to intercept (default: 'submit', 'ajaxSubmit', 'validate');
  $.MultiFile.intercept - intercepts a jQuery plugin / anonymous function
  $.MultiFile.disableEmpty - disable empty inputs (required for some upload scripts)
  $.MultiFile.reEnableEmpty - re-enables empty inputs
  
  17-Mar-2008: v1.27
  MAJOR FIX - OPERA BUG
  MASTER.labels was a readyonly property and cause the script to fail.
  Renamed to MASTER.eLBL. Problem solved!
*/

/*# AVOID COLLISIONS #*/
;if(jQuery) (function($){
/*# AVOID COLLISIONS #*/

 // Fix for Opera: 6-June-2007
 // Stop confusion between null, 'null' and 'undefined'
 //function IsNull(i){
 // return (i==null || i=='null' || i=='' || i=='undefined');
 //};
 
 // extend jQuery - $.MultiFile hook
 $.extend($, {
  MultiFile: function( o /* Object */ ){
   //return $("INPUT[@type='file'].multi").MultiFile(o);
   return $("input:file.multi").MultiFile(o);
  }
 });
 
  
  
 // extend $.MultiFile - global methods
 $.extend($.MultiFile, {
  disableEmpty: function(){
      $('input:file'/*.multi'*/).each(function(){
        var $this = $(this);
        if($this.val()=='') $this.addClass('mfD').each(function(){ this.disabled = true });
      });
  },
    reEnableEmpty: function(){
   $('input:file.mfD').removeClass('mfD').each(function(){ this.disabled = false });
    },
    autoIntercept: [ 'submit', 'ajaxSubmit', 'validate' /* array of methods to intercept */ ],
    intercepted: {},
    intercept: function(methods, context, args){
      var method, value; args = args || [];
      if(args.constructor.toString().indexOf("Array")<0) args = [ args ];
      if(typeof(methods)=='function'){
        $.MultiFile.disableEmpty();
        value = methods.apply(context || window, args);
        $.MultiFile.reEnableEmpty();
        return value;
      };
      if(methods.constructor.toString().indexOf("Array")<0) methods = [methods];
      for(var i=0;i<methods.length;i++){
        method = methods[i]+''; // make sure that we have a STRING
        if(method) (function(method){ // make sure that method is ISOLATED for the interception
          $.MultiFile.intercepted[method] = $.fn[method] || function(){};
          $.fn[method] = function(){
            $.MultiFile.disableEmpty();
            //if(console) console.log(['$.MultiFile.intercepted', method, this, arguments]);
            value = $.MultiFile.intercepted[method].apply(this, arguments);
            $.MultiFile.reEnableEmpty();
            return value;
          }; // interception
        })(method); // MAKE SURE THAT method IS ISOLATED for the interception
      };// for each method
    }
 });
 
  
  
 // extend jQuery function library
 $.extend($.fn, {
   
      // Use this function to clear values of file inputs
      // This doesn't always work: $(element).val('').attr('value', '')[0].value = '';
      reset: function(){ return this.each(function(){ try{ this.reset(); }catch(e){} }); },
        
   // MultiFile function
   MultiFile: function( o /* Object */ ){
    // DEBUGGING: disable plugin
    //return false;
    
    
    //### http://plugins.jquery.com/node/1363
    // utility method to integrate this plugin with others...
    if($.MultiFile.autoIntercept){
         $.MultiFile.intercept( $.MultiFile.autoIntercept /* array of methods to intercept */ );
          $.MultiFile.autoIntercept = null; /* only run this once */
        };
    //###
    
    
    // Bind to each element in current jQuery object
    return $(this).each(function(i){
     if(this._MultiFile) return;
     this._MultiFile = true;
     
       // BUG 1251 FIX: http://plugins.jquery.com/project/comments/add/1251
       // variable i would repeat itself on multiple calls to the plugin.
       // this would cause a conflict with multiple elements
       // changes scope of variable to global so id will be unique over n calls
              window.MultiFile = (window.MultiFile || 0) + 1;
       i = window.MultiFile;
       
       // Remember our ancestors...
       var MASTER = this;
       
       // Copy parent attributes - Thanks to Jonas Wagner
       // we will use this one to create new input elements
       var xCLONE = $(MASTER).clone();
//#########################################
       // Find basic configuration in class string
       // debug???
       MASTER.debug = (MASTER.className.indexOf('debug')>0);
       // limit number of files that can be selected?
       if(!(MASTER.max>0) /*IsNull(MASTER.max)*/){
        MASTER.max = $(MASTER).attr('maxlength');
        if(!(MASTER.max>0) /*IsNull(MASTER.max)*/){
         MASTER.max = (String(MASTER.className.match(/\b(max|limit)\-([0-9]+)\b/gi) || ['']).match(/[0-9]+/gi) || [''])[0];
         if(!(MASTER.max>0) /*IsNull(MASTER.max)*/){
          MASTER.max = -1;
         }
									else{
          MASTER.max = MASTER.max.match(/[0-9]+/gi)[0];
         }
        }
       };
       MASTER.max = new Number(MASTER.max);
       // limit extensions?
       if(!MASTER.accept){
        MASTER.accept = (MASTER.className.match(/\b(accept\-[\w\|]+)\b/gi)) || '';
        MASTER.accept = new String(MASTER.accept).replace(/^(accept|ext)\-/i,'');
       };
       //#########################################
       /*### Default implementation ###
       The plugin will attach itself to file inputs
       with the class 'multi' when the page loads
       
       Use the jQuery start plugin to 
      */
      /*
      if($.start){ $.start('MultiFile', $.MultiFile) }
      else $(function(){ $.MultiFile() });
      */
      if($.start)
       $.start('MultiFile', function(context){ context = context || this; // attach to start-up
        $("INPUT[@type='file'].multi", context).MultiFile();
       });
      // $.start
      else
       $(function(){ $.MultiFile() });
      // $()



      /*# AVOID COLLISIONS #*/
      })(jQuery);
      /*# AVOID COLLISIONS #*/