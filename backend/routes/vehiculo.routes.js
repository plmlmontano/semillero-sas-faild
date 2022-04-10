import {Router} from "express";
const router = Router();

import * as vehiculoCtr from "../controllers/vehiculo.controllers";

router.get('/', vehiculoCtr.getAll);
router.post('/', vehiculoCtr.save);
export default router;