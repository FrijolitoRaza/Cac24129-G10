const sequelize = require('./server/config/db');
const { Movie } = require('./server/routes/moviesRouter');


async function testDatabase() {
    try {
      // Conectar a la base de datos
      await sequelize.authenticate();
      console.log('Conexión establecida correctamente.');
  
      // Ejemplo de consulta para obtener películas
      const movies = await Movie.findAll();
      console.log('Películas encontradas:', movies);
    } catch (error) {
      console.error('Error al conectar a la base de datos:', error);
    } finally {
      // Cerrar la conexión al finalizar
      await sequelize.close();
      console.log('Conexión cerrada correctamente.');
    }
  }
  
  testDatabase();
  