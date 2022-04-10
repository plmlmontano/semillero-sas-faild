import {Router} from "express";
const router = Router();

import * as parqueaderoCtr from "../controllers/parqueadero.controllers";

router.get('/', parqueaderoCtr.getAll);

export default router;