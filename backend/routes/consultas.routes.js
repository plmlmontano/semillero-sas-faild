import {Router} from "express";
const router = Router();

import * as vehiculoCtr from "../controllers/consultas.controllers";

router.get('/count', vehiculoCtr.count);

export default router;