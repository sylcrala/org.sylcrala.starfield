# Starfield (animated or static)
*A customizable starfield acting as your wallpaper*


## Overview
This is a wallpaper plugin built for **Fedora 44's Wayland graphics platform**, intended to provide the ability to replace the traditional image-based wallpapers with an ASCII-based starfield. The wallpaper configuration allows for you to customize the following:
 - the underlying background's color
 - the color of the stars
 - the amount of stars on the screen
 - whether the stars are animated (moving along the x axis)
 - the delay in the animation, in milliseconds (if animation is enabled)

If you have any questions, recommendations, or issues, please submit an issue and I'll see what I can do :)


## Installation
To install this wallpaper plugin, copy the entire directory ('org.sylcrala.starfield') into your user wallpapers directory, located in '~/.local/share/plasma/wallpapers/'

You can also just run the following commands in your terminal instead
```
cd ~/.local/share/plasma/wallpapers/    
git clone https://www.github.com/sylcrala/org.sylcrala.starfield
```

After downloading the repository and ensuring it's located in the wallpapers directory, run the following command to restart plasmashell and load the wallpaper:
`systemctl --user restart plasma-plasmashell.service` 

Now you should be able to find and select 'Starfield' as your wallpaper type in the system settings.
