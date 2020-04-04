<?php declare(strict_types=1);
use PHPUnit\Framework\TestCase;

final class UserTest extends TestCase
{
    const first_name = 'Robert';
    const surname = 'Cicero';
    const bad_surname = 'Cicero21@£';

    protected $userObjectValid;
    protected $userObjectInValid;

    protected function setUp(): void
    {
        $this->userObjectValid = new User(self::first_name, self::surname);
        $this->userObjectInValid = new User(self::first_name, self::bad_surname);
    }

    public function testConstructor(): void
    {
        $this->assertEquals($this->userObjectValid->first_name, self::first_name);
        $this->assertEquals($this->userObjectValid->surname, self::surname);
    }

    public function testPrintName(): void
    {
        $b = $this->userObjectValid->format_name();
        $this->assertEquals($b, self::first_name . ' ' . self::surname);
    }

    public function testValidName(): void
    {
        $bool = $this->userObjectValid->validate_name();
        $this->assertEquals($bool, true);
    }

    public function testInValidName(): void
    {
        $bool = $this->userObjectInValid->validate_name();
        $this->assertEquals(false, $bool);
    }
}
