import { ApiProperty } from '@nestjs/swagger';
import {
  IsEmail,
  IsNotEmpty,
  IsString,
  Matches,
  MaxLength,
  MinLength,
} from 'class-validator';

export class CreateUserDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'The name of the user.',
    example: 'Marcus Silva',
  })
  Name: string;

  @IsEmail()
  @IsNotEmpty()
  @ApiProperty({
    description: 'The email of the user.',
    example: 'marcus.silva@gmail.com',
  })
  Email: string;

  @IsString()
  @MinLength(6)
  @Matches(/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
    message: 'Password too weak',
  })
  @ApiProperty({
    description: 'The password of the user.',
    example: 'Abcd@1234',
  })
  Password: string;

  @IsString()
  @MinLength(11)
  @MaxLength(14)
  @ApiProperty({
    description: 'The cpf of the user.',
    example: '45272096045',
  })
  CPF: string;
}
