import { Injectable } from '@nestjs/common';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { User } from 'src/user/schema/user.schema';
import { UserService } from 'src/user/user.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
   constructor(private usersService: UserService) {
      super({
         jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
         secretOrKey: 'Ng7633nxVa2nPh9ngM8nhDD72cs',
      });
   }

   async validate(payload: any): Promise<User> {
      const user = await this.usersService.findByUsername(payload.username);
      if (!user) {
         throw new Error('User not found');
      }
      return user;
   }
}
