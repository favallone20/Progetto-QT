
# Share display

```xhost +local:root```

# Create docker image

``` docker build -t qt-cpp-dev . ```

# Execute container

```docker run -it --rm -e DISPLAY=$DISPLAY -v $(pwd):/usr/src/app -v /tmp/.X11-unix:/tmp/.X11-unix qt-cpp-dev```
