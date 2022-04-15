import { connect } from "../database";

// contar todos los vehiculos
export const count = async (req, res) => {
    try {
        const connection = await connect();
        const [results] = await connection.query("SELECT count(*) FROM vehiculos");
        if (![results]) {
            return res.status(500).send("No se encontro ningun registro");
        } else {
            return res.status(200).json(results);
        }

    } catch (error) {
        console.error({ error });
        return res.status(500).json({ errorMessage: error.message })
    }

};

