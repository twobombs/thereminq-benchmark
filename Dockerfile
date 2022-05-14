FROM twobombs/cudacluster
#
# install & setup quantum-benchmark + reqs.
RUN git clone https://github.com/yardstiq/quantum-benchmarks.git
#
RUN apt update & apt install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 cmake & apt clean
RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh && chmod 744 Anaconda3-2021.11-Linux-x86_64.sh && bash ./Anaconda3-2021.11-Linux-x86_64.sh -b -p $HOME/anaconda3 && rm Anaconda3-2021.11-Linux-x86_64.sh
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.2-linux-x86_64.tar.gz && tar -xvzf julia-1.7.2-linux-x86_64.tar.gz && cp -r julia-1.7.2 /opt/ && ln -s /opt/julia-1.7.2/bin/julia /usr/local/bin/julia
#
RUN cd /quantum-benchmarks && ./bin/benchmark install && ./bin/benchmark setup
#
EXPOSE 6080
ENTRYPOINT /root/run
