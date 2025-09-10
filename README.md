# CESE_CLP

## Ejercicios de la guía de VHDL
[Guia_VHDL.pdf](Guia_VHDL.pdf)
<!-- Los ejercicios de la guía a entregar para alcanzar el máximo puntaje (1.5) son:
 1, 2, 3, 4, 5, 6, 8, 10, 11, 13, 15, 17 y 18. -->
1. Sumador completo de 1 bit: [sum1b](./codigos/sum1b/fuentes/sum1b.vhd).
2. Sumador de 4 bits: [sum4b](./codigos/sum4b/fuentes/sum4b.vhd)
3. Sumador/restador de 4 bits: [sum_res4b](./codigos/sumres4b/fuentes/sum_res4b.vhd)
4. Multiplexor 2x1: [TODO]
5. Flip-Flop D con reset sincronico: [ffd](./codigos/ffd/fuentes/ffd.vhd)
6. [TODO]
7. [TODO]
8. [TODO]
9. [TODO]
10. Contador binario de 4 bits (estructural): [cont4b](./codigos/cont4b/fuentes/cont4b.vhd).
11. Contador binario de 4 bits (comportamiento): [TODO]
12. Contador binario de N bits (estructural): [TODO]
13. Contador binario de N bits (comportamiento): [contador](./codigos/contador/fuentes/contador.vhd)
14. [TODO]
15. [TODO]
16. [TODO]
17. Generador de habilitacion cada N ciclos: [genEna](./codigos/genEna/fuentes/genEna.vhd)
18. [TODO]

## Instrucciones para correr ModelSim en docker (Ubuntu 22.04 Wayland)

Estas instrucciones estan basadas en este [repo](https://gitlab.cern.ch/ecalvo/CI-hdl/-/blob/master/Dockerfile_ModelSim).

1. Bajar el ejecutable de ModelSim de la [web](https://www.intel.com/content/www/us/en/software-kit/750291/modelsim-intel-fpgas-standard-edition-software-version-17-1.html). Este repo corre con la version 17.1.

2. En una carpeta colocar el `.run` junto con el archivo [Dockerfile](./modelsim/Dockerfile.modelsim17).

3. Buildear la imagen del container:
```bash
docker build -f ./Dockerfile_ModelSim . --network=host -t modelsim_17
```
4. En la misma carpeta, agregar el archivo [docker-compose](./modelsim/docker-compose.yml) para facilitar la corrida del container. En el mismo pueden editar la ubicación de sus archivos fuente para que se vean desde el simulador:
```yml
    volumes:
      - ../codigos:/workspace
```
5.  Para correr el container utilizando el `docker-compose.yml`, correr (dentro de la misma carpeta en la que se encuentra el archivo):
```bash
docker compose up
```
6. Alternativamente, pueden ejecutar el container desde la consola:
```bash
docker run -it --rm --net=host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v /etc/machine-id:/etc/machine-id modelsim_17
```
Una vez en el container, deben correr el comando `vsim` (o `/home/developer/intelFPGA/17.1/modelsim_ase/bin/vsim` si no lo encuentra).
