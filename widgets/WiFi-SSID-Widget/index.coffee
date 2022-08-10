# WiFi SSID Widget
#
# Joe Kelley
#
# This widget displays the current connected WiFi network name. It can be helpful if you are in an environment where multiple networks are available. 
# It uses the built-in OS X airport framework to get and display the SSID name (up to 20 characters in length)


command: "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep ' SSID' | cut -c 18-38"

refreshFrequency: 10000

# Adjust the style settings to suit. I've set the position to be just below the WiFi icon in my menu bar.

style: """
  top:  10%
  left: 0.5rem
  color: #7dff7d
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto",
    "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue",
    sans-serif


  div
    display: block
    border: 1px solid #000000
    border-radius: 0.5rem
    text-shadow: 0 0 1px rgba(#000, 0.5)
    background: rgba(#000, 0.5)
    font-size: 11px
    font-weight: 400
    padding: 1rem 8.7rem 1rem 1rem
    


    &:after
      content: 'WiFi'
      font-family: "Ubuntu"
      text_align: "center"
      position: absolute
      color: #fff
      left: 70px
      top: 4px
      font-size: 1rem
      font-weight: 600
      
 img
    height: 24px
    width: 24px
    margin-bottom: -3px
      
"""

render: -> """
  <div><img src="wifi-ssid.widget/icon48.png">
   <a class='ssid'></a></div>
"""

update: (out) ->
	if(out)
  		$('.ssid').html(out)
  	else
  		 $('.ssid').html(out + 'No WiFi')

