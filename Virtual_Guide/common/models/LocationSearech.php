<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Location;

/**
 * LocationSearech represents the model behind the search form about `common\models\Location`.
 */
class LocationSearech extends Location
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ID', 'countryID', 'zoom', 'categoryID', 'userID'], 'integer'],
            [['name', 'descr', 'lon', 'lat', 'address', 'tag'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Location::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'ID' => $this->ID,
            'countryID' => $this->countryID,
            'zoom' => $this->zoom,
            'categoryID' => $this->categoryID,
            'userID' => $this->userID,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'descr', $this->descr])
            ->andFilterWhere(['like', 'lon', $this->lon])
            ->andFilterWhere(['like', 'lat', $this->lat])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'tag', $this->tag]);

        return $dataProvider;
    }
}
