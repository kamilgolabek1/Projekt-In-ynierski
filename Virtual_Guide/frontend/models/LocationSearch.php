<?php

namespace frontend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\Location;

/**
 * LocationSearch represents the model behind the search form about `frontend\models\Location`.
 */
class LocationSearch extends Location
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ID', 'city', 'zoom', 'category'], 'integer'],
            [['name', 'descr', 'lon', 'lat', 'country', 'province', 'address'], 'safe'],
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
            'city' => $this->city,
            'zoom' => $this->zoom,
            'category' => $this->category,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'descr', $this->descr])
            ->andFilterWhere(['like', 'lon', $this->lon])
            ->andFilterWhere(['like', 'lat', $this->lat])
            ->andFilterWhere(['like', 'country', $this->country])
            ->andFilterWhere(['like', 'province', $this->province])
            ->andFilterWhere(['like', 'address', $this->address]);

        return $dataProvider;
    }
}
