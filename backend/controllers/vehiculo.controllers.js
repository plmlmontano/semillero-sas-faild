import { connect } from "../database";

export const getAll = async (req, res) => {
    try {
        const connection = await connect();
        const [results] = await connection.query(`SELECT a.nro_placa, c.descripcion marca, b.descripcion linea, a.color, a.modelo, DATE_FORMAT(a.fecha_vencimiento_seguro, '%d/%m/%Y') 'Fecha de vencimiento seguro', DATE_FORMAT(a.fecha_vencimiento_tecnomecanica, '%d/%m/%Y') 'Fecha de vencimiento tecnomecanica', a.estado 
        FROM vehiculos a
        LEFT JOIN linea b ON a.id_linea = b.id
        LEFT JOIN marca c ON b.id_marca = c.id;`);
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

export const save = async (req, res) => {
    try {
        const data = req.body;
        const connection = await connect();
        let save = {
            ...data,
            estado: 1
        }
        const [results] = await connection.query("INSERT INTO vehiculos SET ?", save);
        if (![results]) {
            return res.status(500).send("No se encontro ningun registro");
        } else {
            return res.status(200).json(`Nuevo registro: ${results}`);
        }
    } catch (error) {
        console.error({ error });
        return res.status(500).json({ errorMessage: error.message })
    }
}

export const update = async (req, res) => {
    try {
        const placa = req.params.placa;
        const data = req.body;
        const connection = await connect();
        const [results] = await connection.query("UPDATE vehiculos SET ? WHERE nro_placa = ?;", [data, placa]);
        if (![results]) {
            return res.status(500).send("Error al actualizar los datos.");
        } else {
            return res.status(200).send("¡Datos actualizados con éxito!");
        }
    } catch (error) {
        console.error({ error });
        return res.status(500).json({ errorMessage: error.message })
    }
};

export const deleteByPlaca = async (req, res) => {
    try {
        const placa = req.params.placa;
        const connection = await connect();
        const [results] = await connection.query("DELETE FROM vehiculos WHERE nro_placa = ?;", [placa]);
        if (!results) {
            return res.status(500).send("Error al eliminar los datos.");
        } else {
            return res.status(200).send("¡Datos eliminados con éxito!");
        }

    } catch (error) {
        console.log({ error });
        return res.status(500).json({ errorMessage: error.message })
    }
};


export const all = async (req, res) => {
    try {
        const connection = await connect();
        const [results] = await connection.query("SELECT * FROM vehiculos");
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