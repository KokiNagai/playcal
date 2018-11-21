module PostsHelper

  def prefURL(name)
    prefURL = "search?utf8=✓&q%5Bprefecture_eq%5D=" + name + "&q%5Bcity_cont%5D=&q%5Bplayday_gteq%281i%29%5D=&q%5Bplayday_gteq%282i%29%5D=&q%5Bplayday_gteq%283i%29%5D=&q%5Bplayday_lteq%281i%29%5D=&q%5Bplayday_lteq%282i%29%5D=&q%5Bplayday_lteq%283i%29%5D=&q%5Bstyle_eq%5D=&button="
  end
end
