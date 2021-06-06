class Game::Adventure::LoopObject {

      has $!is_running;

      submethod BUILD() {
      		$!is_running = True;
      }

      multi method loopOnce() {

      }

      multi method mainloop() {

      }

}
