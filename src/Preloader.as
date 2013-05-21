package {
    import flash.display.DisplayObject;
    import flash.display.MovieClip;
    import flash.events.IOErrorEvent;
    import flash.utils.getDefinitionByName;

    import mochi.as3.*;

    
    public dynamic class Preloader extends MovieClip {
        
        private var did_load:Boolean;
        public static var MAIN_CLASS:String = "Main";
        public static var GAME_OPTIONS:Object = {id: "test", res:"480x360"};

        public function Preloader() {
            super();

            var f:Function = function(ev:IOErrorEvent):void {
                ///
            }
            loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, f);

            var opts:Object = {};
            for (var k:String in GAME_OPTIONS) {
                opts[k] = GAME_OPTIONS[k];
            }

            opts.ad_started = function ():void {
                did_load = true;
            }

            opts.ad_finished = function ():void {
                var mainClass:Class = Class(getDefinitionByName(MAIN_CLASS));
                var app:Object = new mainClass();
                addChild(app as DisplayObject);
            }

            opts.clip = this;

            MochiAd.showPreGameAd(opts);
        }


    }

}
