import express from 'express';
import morgan from 'morgan';

import authenticate from './util/authenticate';
import userRouter from './router/userRouter';
import followRouter from './router/followRouter';
import habitDataRouter from './router/habitDataRouter';

const app = express();
app.use(morgan('short'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/user', authenticate, userRouter);
app.use('/follow', authenticate, followRouter);
app.use('/user_habit_data', authenticate, habitDataRouter);

export default app;
