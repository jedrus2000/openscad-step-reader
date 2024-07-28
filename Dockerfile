FROM debian:12 as builder

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install libocct-foundation-7.6 libocct-foundation-dev libocct-modeling-data-7.6 libocct-modeling-data-dev \
    libocct-modeling-algorithms-7.6 libocct-modeling-algorithms-dev libocct-visualization-7.6 libocct-visualization-dev \
    libocct-ocaf-7.6 libocct-ocaf-dev libocct-data-exchange-7.6 libocct-data-exchange-dev libocct-draw-7.6 \
    libocct-draw-dev occt-draw occt-misc libocct-doc \
    cmake libfreeimage-dev libfreetype-dev libgl-dev libglvnd-dev libglu-dev libtbb-dev libx11-dev libxext-dev libxi-dev libxmu-dev rapidjson-dev tcl-dev tk-dev \
    git build-essential g++ \
    && rm -rf /var/lib/apt/lists/*

FROM builder as openscad-step-reader

RUN mkdir /openscad-step-reader
COPY . /openscad-step-reader
RUN cd /openscad-step-reader \
    && make all \
    && cp openscad-step-reader /usr/bin

ENTRYPOINT ["openscad-step-reader"]
CMD ["--help"]