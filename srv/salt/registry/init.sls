"Download nimblestratus/rpi-docker-registry":
  dockerng.image_present:
    - name: 'nimblestratus/rpi-docker-registry'
    - require:
      - pip: "docker-py"

"Run registry":
  dockerng.running:
    - name: registry 
    - restart_policy: always
    - image: nimblestratus/rpi-docker-registry
    - ports:
      - 5000/tcp
    - port_bindings:
      - 5000:5000/tcp
    - environment:
        - BLABLA: 'bla'
      # - DOCKER_OPTS: '--insecure-registry 192.168.1.61:5000'
      # - MIRROR_SOURCE_INDEX: 'https://index.docker.io'
      # - VIRTUAL_HOST: 'drone.db01.freakhome.ddnss.de'
    - binds:
      - /var/docker/registry:/tmp/registry
    - dns:
      - 8.8.8.8
      - 8.8.4.4
    - require:
      - dockerng: "Download nimblestratus/rpi-docker-registry"