import { Controller, Get, UseGuards } from '@nestjs/common';
import { User } from './schema/user.schema';
import { UserService } from './user.service';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';

@Controller('user')
export class UserController {
   constructor(private readonly userService: UserService) {}

   @UseGuards(JwtAuthGuard)
   @Get()
   async getAllUsers(): Promise<User[]> {
     return this.userService.findAll();
   }
}
