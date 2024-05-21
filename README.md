# Detalles del proyecto - regresión

**Antecedentes**: Usted trabaja como analista para una empresa de bienes raíces. Su empresa quiere crear un modelo de aprendizaje automático para predecir los precios de venta de las casas en función de una variedad de características sobre las cuales se evalúa el valor de la casa.

**Objetivo**: La tarea es construir un modelo que prediga el precio de una casa en función de las características proporcionadas en el conjunto de datos. La alta dirección también quiere explorar las características de las viviendas utilizando alguna herramienta de inteligencia empresarial. Uno de esos parámetros incluye comprender qué factores son responsables del mayor valor de la propiedad: \$650K y más.
Las preguntas se proporcionan más adelante en el documento para las cuales puede utilizar Tableau.

**Datos**: El conjunto de datos consta de información sobre unas 22.000 propiedades. El conjunto de datos constaba de datos históricos de casas vendidas entre mayo de 2014 y mayo de 2015.
Estas son las definiciones de los puntos de datos proporcionadas:
(Nota: para algunas de las variables que se explican por sí mismas, no se ha proporcionado ninguna definición)

- **Id**: Número de identificación único del inmueble.
- **fecha**: fecha en que se vendió la casa.
- **precio**: precio de la vivienda.
- **frente al mar**: casa que tiene vista al mar.
- **condición**: Qué tan buena es la condición (en general). **1** indica propiedad desgastada y **5** excelente.
- **calificación**: Calificación general otorgada a la unidad de vivienda, según el sistema de calificación del condado de King. 1 pobre, 13 excelente.
- **Sqft_above**: pies cuadrados de la casa aparte del sótano.
- **Sqft_living15**: Área de sala de estar en 2015 (implica algunas renovaciones). Esto podría haber afectado o no el tamaño del lote.
- **Sqft_lot15**: área del tamaño del lote en 2015 (implica: algunas renovaciones).

### Explorando los datos

Le recomendamos que comprenda a fondo sus datos y tome las medidas necesarias para prepararlos para el modelado antes de crear modelos exploratorios o predictivos. Dado que se trata de un modelo de clasificación, puede utilizar la regresión lineal para la clasificación y construir un modelo. También le recomendamos que utilice otros modelos en su proyecto, incluidos KNN, árboles de decisión para regresión.
Para explorar los datos, puedes utilizar las técnicas que se han comentado en clase. Algunos de ellos incluyen el uso del método describe, la verificación de valores nulos y el uso de _matplotlib_ y _seaborn_ para desarrollar visualizaciones.
Los datos tienen una serie de variables categóricas y numéricas. Explore la naturaleza de los datos para estas variables antes de comenzar con el proceso de limpieza de datos y luego el preprocesamiento de datos (escalado de variables numéricas y codificación de variables categóricas).
También utilizará Tableau para explorar visualmente los datos en mayor profundidad.

### Modelo

Utilice diferentes modelos para comparar las precisiones y encontrar el modelo que mejor se ajuste a sus datos. Puedes utilizar las medidas de precisiones que se han comentado en clase. Tenga en cuenta que al comparar diferentes modelos, asegúrese de utilizar la misma medida de precisión como punto de referencia.