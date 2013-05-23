$:.unshift(".")

require 'motion'

class MyListener < Leap::Motion::Listener
  def on_init x
    print "on_init" 
    p x
  end

  def on_connect x
    print "on_connect"
    p x
  end

  def on_disconnect x
    print "on disconnect"
    p x
  end

  def on_exit x
    print "on exit"
    p x
  end

  def on_frame x
    print "on frame"
    p x

  end

  def on_focus_gained x
    print "on focus gained"
    p x
  end

  def on_focus_lost x
    print "on focus lost"
    p x
  end
end

listener = MyListener.new
controller = Leap::Motion::Controller.new
controller.add_listener listener

gone = gets
print gone

controller.remove_listener listener

