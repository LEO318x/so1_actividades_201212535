# Tipos de Kernel y sus diferencias
El kernel es una parte fundamental del sistema operativo que se encarga de conceder el acceso al hardware de forma segura para todo el software que lo solicita.

Actualmente existen tres tipos de kernel: 
1.  **Kernel monolítico**. Un kernel grande para todas las tareas. Es el único responsable de la gestión de la memoria y de los procesos, de la comunicación entre procesos y proporciona funciones de soporte de drivers y hardware. Los sistemas operativos que usan el kernel monolítico son Linux, OS X y Windows.
2.  **Microkernel**. El microkernel se ha diseñado intencionadamente de un tamaño pequeño para que en caso de fallo no paralice todo el sistema operativo. No obstante, para que pueda asumir las mismas funciones que un kernel grande, está dividido en varios módulos. Como ejemplo de aplicación solo existe el componente Mach de OS X, ya que hasta ahora no hay ningún sistema operativo con microkernel.
3.  **Kernel híbrido**. La combinación del kernel monolítico y el microkernel se denomina kernel híbrido. En este caso, el kernel grande se hace más compacto y modulable. Otras partes del kernel pueden cargarse dinámicamente. Esto ya ocurre en cierta medida en Linux y OS X.

La principal diferencia entre estos tipos de kerneles es el número de espacios de direcciones de memoria que admiten, por lo que podemos mencionar lo siguiente:

 - Un micronúcleo delega los procesos y servicios de usuario y los
   servicios del núcleo en diferentes espacios de direcciones.
   
 - Un kernel monolítico implementa los servicios en el mismo espacio de 
   direcciones.

 - Un kernel híbrido, como los de Microsoft Windows NT y Apple XNU,   
   intenta combinar los comportamientos y ventajas de las arquitecturas 
   de microkernel y kernel monolítico.

# User vs Kernel Mode
### User: 
Cuando se inicia un programa en un sistema operativo, por ejemplo Windows, el programa se ejecuta en modo usuario. Y cuando un programa en modo usuario solicita ejecutarse, windows crea para él un proceso y un espacio de direcciones virtual (espacio de direcciones para ese proceso). Los programas en modo usuario tienen menos privilegios que las aplicaciones en modo usuario y no pueden acceder directamente a los recursos del sistema. Por ejemplo, si una aplicación en modo usuario quiere acceder a los recursos del sistema, tendrá que pasar primero por el núcleo del sistema operativo utilizando syscalls.  

### Kernel Mode:
El kernel es el programa central en el que se basan todos los demás componentes del sistema operativo, se utiliza para acceder a los componentes de hardware y programar qué procesos deben ejecutarse en un sistema informático y cuándo, y también gestiona el software de aplicación y la interacción con el hardware. De ahí que sea el programa más privilegiado, ya que, a diferencia de otros programas, puede interactuar directamente con el hardware. Cuando los programas que se ejecutan en modo usuario necesitan acceder al hardware, por ejemplo la webcam, primero tienen que pasar por el kernel mediante una syscall, y para llevar a cabo estas peticiones la CPU cambia de modo usuario a modo kernel en el momento de la ejecución. Después de completar la ejecución del proceso, la CPU vuelve al modo usuario.

| Criterio | Modo Kernel | Modo Usuario|
|--|--|--|
|**Kernel-mode vs User mode**|En modo kernel, el programa tiene acceso directo y sin restricciones a los recursos del sistema.	|En modo usuario, el programa de aplicación se ejecuta e inicia.|
|**Interrupciones**|Todo el sistema operativo podría caerse si se produce una interrupción.|Un único proceso falla si se produce una interrupción.  |
|**Modo**|El modo kernel también se conoce como modo maestro, modo privilegiado o modo sistema.|El modo usuario también se conoce como modo sin privilegios, modo restringido o modo esclavo.|
|**Funcionalidad**|El modo kernel puede referirse a cualquier bloque de memoria del sistema y también puede dirigir a la CPU para la ejecución de una instrucción, lo que lo convierte en un modo muy potente y significativo.|El modo usuario es un modo de visualización estándar y típico, lo que implica que la información no puede ejecutarse por sí misma ni hacer referencia a ningún bloque de memoria; necesita una Interfaz de Protocolo de Aplicación (API) para conseguir estas cosas.|

