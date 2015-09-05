<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Location;

/**
 * LocationSearch represents the model behind the search form about `backend\models\Location`.
 */
class LocationSearch extends Location
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ID', 'Category', 'Zoom'], 'integer'],
            [['Nazwa', 'Opis', 'Lon', 'Lat', 'ForumID', 'Adres'], 'safe'],
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
            'Category' => $this->Category,
            'Zoom' => $this->Zoom,
        ]);

        $query->andFilterWhere(['like', 'Nazwa', $this->Nazwa])
            ->andFilterWhere(['like', 'Opis', $this->Opis])
            ->andFilterWhere(['like', 'Lon', $this->Lon])
            ->andFilterWhere(['like', 'Lat', $this->Lat])
            ->andFilterWhere(['like', 'ForumID', $this->ForumID])
            ->andFilterWhere(['like', 'Adres', $this->Adres]);

        return $dataProvider;
    }
}
