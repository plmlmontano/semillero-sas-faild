import moment from 'moment'

import { connect } from "../database";


export const getAll = async (req, res) => {
    const connection = await connect();
    const [results] = await connection.execute("SELECT * FROM vehiculos");
    return res.status(201).json(results);
};
