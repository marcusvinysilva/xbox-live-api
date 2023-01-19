import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString, IsUrl } from 'class-validator';

export class CreateProfileDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty({
    description: 'The name of the profile',
    example: 'marcusvinysilva',
  })
  Title: string;

  @IsUrl()
  @ApiProperty({
    description: 'The image of the profile',
    example: 'https://avatars.githubusercontent.com/u/71359413?v=4.png',
  })
  ImageURL: string;
}
