import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MongooseModule } from '@nestjs/mongoose';
import { AuthModule } from './auth/auth.module';
import { UserModule } from './user/user.module';

@Module({
  imports: [MongooseModule.forRoot('mongodb://localhost:27017/auth-demo'), AuthModule, UserModule,],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
