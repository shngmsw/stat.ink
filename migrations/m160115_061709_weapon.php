<?php
use yii\db\Migration;
use app\models\Special;
use app\models\Subweapon;
use app\models\WeaponType;
use app\models\DeathReasonType;

class m160115_061709_weapon extends Migration
{
    public function safeUp()
    {
        $this->insert('weapon', [
            'type_id' => WeaponType::findOne(['key' => 'splatling'])->id,
            'key' => 'hydra_custom',
            'name' => 'Custom Hydra Splatling',
            'subweapon_id' => Subweapon::findOne(['key' => 'sprinkler'])->id,
            'special_id' => Special::findOne(['key' => 'barrier'])->id,
        ]);

        $this->insert('death_reason', [
            'type_id' => DeathReasonType::findOne(['key' => 'main'])->id,
            'key' => 'hydra_custom',
            'name' => 'Custom Hydra Splatling',
        ]);
    }

    public function safeDown()
    {
        $keys = [
            'hydra_custom',
        ];
        $this->delete('death_reason', ['key' => $keys]);
        $this->delete('weapon', ['key' => $keys]);
    }
}